<?php
/*
Theme Name: dreamfree
Theme URI: https://osclass-ar.com/
Description: <%- pkg.description %>
Version: <%- pkg.version %>
Author: <%- pkg.author %>
Author URI: https://osclass-ar.com/
Widgets:  header, footer
Theme update URI: dreamfree
*/

    function dreamfree_theme_info() {
        return array(
             'name'        => 'dreamfree'
            ,'version'     => '<%- pkg.version %>'
            ,'description' => '<%- pkg.description %>'
            ,'author_name' => '<%- pkg.author %>'
            ,'author_url'  => 'https://osclass-ar.com'
            ,'locations'   => array()
        );
    }

?>