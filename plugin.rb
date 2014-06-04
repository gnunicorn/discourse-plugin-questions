# name: questions
# about: adds an archetype rendered in the classic question-answer style
# version: 0.1
# authors: Benjamin Kampmann

# load the engine
# load File.expand_path('../lib/questions/engine.rb', __FILE__)

register_asset "javascripts/discourse/templates/connectors/composer-open/selectable_archetype.js.handlebars"
register_asset "javascripts/questions/questions_post_view.js"
register_asset "javascripts/questions/questions_creations_view.js"
register_asset "javascripts/discourse/templates/big_like.js.handlebars"

register_asset "question_styles.css"

after_initialize do
	require_dependency File.expand_path('../integrate.rb', __FILE__)
end