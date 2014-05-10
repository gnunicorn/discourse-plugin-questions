# name: questions
# about: adds an archetype rendered in the classic question-answer style
# version: 0.1
# authors: Benjamin Kampmann

# load the engine
# load File.expand_path('../lib/questions/engine.rb', __FILE__)

register_asset 'javascripts/questions_injects.js', :template_injector

register_asset "javascripts/questions/questions_post_view.js"
register_asset "javascripts/questions/questions_creations_view.js"
register_asset "javascripts/discourse/templates/big_like.js.handlebars"

register_css <<CSS

.bigLikeNumber {
 text-align: center;
}

.bigLikeNumber:before {
    display: block;
    position: absolute;
    top: 5px;
    left: 5px;
    color: #F5F5F5;
    font: 90px/1 FontAwesome;
    content: "\f004";
    z-index: -5;
}

.bigLikeNumber h2 {
    color: #333;
    font-size: 45px;
    line-height: 90px;
}

#reply-control .control .reply-to label {
    display: inline;
    margin: 0 2px;
}

#reply-control .control .reply-to label input {
 margin: 0 3px;
}

CSS

after_initialize do
	require_dependency File.expand_path('../integrate.rb', __FILE__)
end