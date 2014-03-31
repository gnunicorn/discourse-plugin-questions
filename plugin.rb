# name: questions
# about: adds an archetype rendered in the classic question-answer style
# version: 0.1
# authors: Benjamin Kampmann

# load the engine
# load File.expand_path('../lib/questions/engine.rb', __FILE__)


register_asset "javascripts/questions/questions.js"

register_css <<CSS


CSS

after_initialize do
	require_dependency File.expand_path('../integrate.rb', __FILE__)
end