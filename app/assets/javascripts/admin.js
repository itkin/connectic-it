//= require jquery
//= require jquery_ujs
//= require tinymce-jquery


$(function(){
  tinymce.init({
    selector: ".editable",
    toolbar: "undo redo | bold italic",
    inline: true,
    menubar : false,
    forced_root_block: false,
    setup: function(editor) {
      editor.on('blur', function(e) {
        var editor = tinyMCE.activeEditor;
        var data = {label: $(editor.getElement()).data('label') };
        data['content'] = editor.getContent();
        $.ajax({
          type: "POST",
          url: '/olala/labels',
          data: data,
          success: function () {
            console.log('success', 'Modifications enregistrées');
          },
          failure: function () {
            console.log('error', "Impossible d'enregistrer les modifications (1)");
          },
          error: function () {
            console.log('error', "Impossible d'enregistrer les modifications (2)");
          }
        });
        console.log('blur event', e);
        console.log('blur event', e);
      });
    }
  });
});
$(function(){
  $('a, button').on('click', function(e){
    if ($(e.target).closest('.editable').length){
      e.preventDefault();
    }
  });
});

//  Aloha = window.Aloha || ( window.Aloha = {} );
//  Aloha.settings = {
//    plugins: {
//      load: "common/ui, common/format" //"common/format, common/table, common/list, common/link, common/block, common/undo, common/contenthandler, common/paste, common/commands, common/abbr, extra/browser, extra/linkbrowser"
//    }
//  };
//});

