$(document).ready(function(){
    $(".opt_delete_account a").click(function(){
        $("#dialog-delete-account").dialog('open');
    });

    $("#dialog-delete-account").dialog({
        autoOpen: false,
        modal: true,
        buttons: [
            {
                text: dreamfree.langs.delete,
                click: function() {
                    window.location = dreamfree.base_url + '?page=user&action=delete&id=' + dreamfree.user.id  + '&secret=' + dreamfree.user.secret;
                }
            },
            {
                text: dreamfree.langs.cancel,
                click: function() {
                    $(this).dialog("close");
                }
            }
        ]
    });
});