function tagAdded(data){
    var val = data.addedInput.text;
    var input = data.context[0].id + ' input';
    ga('send', 'event', input, 'addTag', val);
}



$('#user-tags').tagThis({
    interactive: false,
    noDuplicates: true,
    callbacks: {
        afterAddTag : tagAdded
    }
});

$('.add-button').on('click', function(){

    var tagData = {
        text : $(this).siblings('.name').text(),
        id : $(this).parent().data('id')
    };

    $('#user-tags').addTag(tagData);
    ga('send', 'event', 'add tag button', 'click', 'user example' );
});

$('.see-code-button').on('click', function(){
    var pre = $(this).parent().find('pre');
    var txt =  pre.is(':visible') ? 'see code' : 'hide code';
    $(this).text(txt);
    pre.toggle();
    ga('send', 'event', 'see/hide code button', 'click');
});

$('.user-clear-all-button').on('click', function(){
    $('#user-tags').clearAllTags();
    ga('send', 'event', 'clear all button', 'click', 'user example');
});


$('a').on('click', function(){
    var href = $(this).attr('href');
    ga('send', 'event', 'external link', 'click', href);
});
