/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config) {
	config.toolbarGroups = [
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
		{ name: 'forms', groups: [ 'forms' ] },
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'styles', groups: [ 'styles' ] },
		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
		{ name: 'links', groups: [ 'links' ] },
		{ name: 'insert', groups: [ 'insert' ] },
		{ name: 'colors', groups: [ 'colors' ] },
		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'tools', groups: [ 'tools' ] },
		{ name: 'others', groups: [ 'others' ] },
		{ name: 'about', groups: [ 'about' ] }
	];
	config.removePlugins = 'elementspath';//不显示底部
	config.resize_enabled = false;//不显示底部
	config.removeButtons = 'Save,NewPage,Print,Templates,Format,Styles,BGColor,TextColor,ShowBlocks,About,HiddenField,ImageButton,Button,Select,Textarea,TextField,Radio,Checkbox,Form,Scayt,SelectAll,Find,Replace,Redo,Undo,Cut,Copy,Paste,PasteText,PasteFromWord,Language,BidiRtl,BidiLtr,CreateDiv,Blockquote,Outdent,Indent,RemoveFormat,Flash,Table,HorizontalRule,Smiley,SpecialChar,PageBreak,Iframe,Anchor,Unlink,Subscript,Superscript';
	config.image_previewText=' '; //图片预览区域显示内容
	config.filebrowserImageUploadUrl= ctx+"/common/uploadCkEditorImg"; //待会要上传的action或servlet
};
