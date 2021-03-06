package Friends::Link;

use strict;

use base qw( MT::Object );

__PACKAGE__->install_properties(
    {
        datasource => 'diso_friend_uri',

        column_defs => {
            'id'           => 'integer not null auto_increment',
            'friend_id'    => 'integer not null',
            'author_id'    => 'integer not null',
            'uri'          => 'text not null',
            'label'        => 'text',
            'notes'        => 'text',
            'last_updated' => 'timestamp',
            'openid'       => 'text',
            'hcard'        => 'integer',
            'pending'      => 'integer',
	    'iconclass'	   => 'string(50)',
        },
		defaults => {
			pending => 0,
		},
        class_type  => 'link',
        primary_key => 'id',
        audit       => 1,
    }
);

sub friend {
    my $link          = shift;
    my $friend_class = MT->model('friend');
    my $friend = $friend_class->load( { id => $link->friend_id } );
    return $friend;
}

sub class_label        { MT->translate('URL'); }
sub class_label_plural { MT->translate('URLs'); }

sub class_iconclass        { MT->translate('Icon'); }
sub class_iconclass_plural { MT->translate('Icons'); }
1;
