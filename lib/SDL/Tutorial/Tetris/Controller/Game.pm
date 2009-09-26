package SDL::Tutorial::Tetris::Controller::Game;

use base 'SDL::Tutorial::Tetris::Controller';

use Class::XSAccessor accessors => { 
    grid => 'grid'
};

use Data::Dumper;
use Time::HiRes qw/time/;
use Readonly;

use SDL::Tutorial::Tetris::Model::Grid;
use SDL::Tutorial::Tetris::Model::Blocks;
use SDL::Tutorial::Tetris::Event;

Readonly my $STATE_PREPARING => 0;
Readonly my $STATE_RUNNING   => 1;
Readonly my $STATE_PAUSED    => 2;

sub new {
    my ($class, %params) = (@_);

    my $self = $class->SUPER::new(%params);

    $self->evt_manager->reg_listener($self);

    $self->{level} = 0.5;
    $self->{state} = $STATE_PREPARING;

    print "Game PREPARING ... \n" if $self->GDEBUG;

    $self->init_grid;
    $self->evt_manager->post(SDL::Tutorial::Tetris::Event::GridBuilt->new($self->grid));

    #$self->{player} =; For points, level so on

    return $self;
}

sub start {
    my $self = shift;

    $self->{state} = $STATE_RUNNING;
    print "Game RUNNING \n" if $self->GDEBUG;
    my $event = SDL::Tutorial::Tetris::Event::GameStart->new($self);
    $self->evt_manager->post($event);
    $self->{wait} = time;
}

sub init_grid {
    my $self = shift;
    $self->grid(SDL::Tutorial::Tetris::Model::Grid->new());
    $self->{piece}         = int(rand(7));    # 0 1 2 3 4 5 6 Pieces
    $self->{pieceRotation} = int(rand(4));    # 0 1 2 3 rotations
    $self->{posx} =
      $self->grid->{width} / 2
      + SDL::Tutorial::Tetris::Model::Blocks::get_x_init_pos($self->{piece}, $self->{pieceRotation});
    $self->{posy} =
      SDL::Tutorial::Tetris::Model::Blocks::get_y_init_pos($self->{piece}, $self->{pieceRotation});

    #     //  Next piece
    $self->{next_piece}    = int(rand(7));
    $self->{next_rotation} = int(rand(4));
    $self->{next_posx}     = ($self->grid->{width}) + 1;
    $self->{next_posy}     = 0;
}

sub create_new_piece {
    my $self = shift;
    $self->{piece}         = $self->{next_piece};
    $self->{pieceRotation} = $self->{next_rotation};
    $self->{posx} =
      $self->grid->{width} / 2
      + SDL::Tutorial::Tetris::Model::Blocks::get_x_init_pos($self->{piece}, $self->{pieceRotation});
    $self->{posy} =
      SDL::Tutorial::Tetris::Model::Blocks::get_y_init_pos($self->{piece}, $self->{pieceRotation});

    #     //  Next piece
    $self->{next_piece}    = int(rand(7));
    $self->{next_rotation} = int(rand(4));
}

sub notify {
    my ($self, $event) = (@_);

    print "Notify in GAME \n" if $self->EDEBUG;

    if ( defined $event and $event->name ne 'SDL::Tutorial::Tetris::Event::GridBuilt' ) {
        if ($self->{state} == $STATE_PREPARING) {
            print "Event " . $event->name . "caught to start Game  \n"
              if $self->GDEBUG;
            $self->start;
        }
        if ($self->{state} == $STATE_RUNNING) {

            #lets grab those move requests events
            if ($event->name eq 'CharactorMoveRequest') {
                print "Move charactor sprite \n" if $self->GDEBUG;
                my ($mx, $my, $rot) =
                  ($self->{posx}, $self->{posy}, $self->{pieceRotation});
                if ($event->direction == $self->ROTATE_C) {
                    $rot++;
                    $rot = $rot % 4;
                }
                if ($event->direction == $self->ROTATE_CC) {
                    $rot--;
                    $rot = $rot % 4;
                }
                $my++ if ($event->direction == $self->DIRECTION_DOWN);
                $mx-- if ($event->direction == $self->DIRECTION_LEFT);
                $mx++ if ($event->direction == $self->DIRECTION_RIGHT);

                if ($self->grid->is_possible_movement(
                        $mx, $my, $self->{piece}, $rot
                    )
                  )
                {
                    ($self->{posx}, $self->{posy}, $self->{pieceRotation}) =
                      ($mx, $my, $rot);

                    $self->evt_manager->post(SDL::Tutorial::Tetris::Event->new( name => 'CharactorMove' ));
                }
            }
            if ($event->name eq 'Tick'
                and ((time - $self->{wait}) > $self->{level}))
            {
                $self->{wait} = time;

                if ($self->grid->is_possible_movement(
                        $self->{posx},  $self->{posy} + 1,
                        $self->{piece}, $self->{pieceRotation}
                    )
                  )
                {
                    $self->{posy}++;
                    $self->evt_manager->post(SDL::Tutorial::Tetris::Event->new( name => 'CharactorMove' ));
                }
                else {

                    $self->grid->store_piece(
                        $self->{posx},  $self->{posy},
                        $self->{piece}, $self->{pieceRotation}
                    );
                    $self->create_new_piece();

                    $self->{level}
                      -= (0.01) * $self->grid->delete_possible_lines;
                    if ($self->grid->is_game_over()) {

                        #make this SDL::Tutorial::Tetris::Event::GameOver
                        $self->evt_manager->post(SDL::Tutorial::Tetris::Event->new( name => 'Quit' ));
                    }
                }
            }

        }
    }

    #if we did not have a tick event then some other controller needs to do
    #something so game state is still beign process we cannot have new input
    #now
}

1;
