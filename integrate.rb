module PostArchetypeQuestion
  def self.included(klass)
    klass.before_create :set_default_vote_score
  end

  def set_default_vote_score
    if self.archetype == 'question' && self.post_number > 1
      self.vote_score ||= Topic.vote_score_calibration
    end

    Rails.logger.debug "FOO: #{self}"
  end
end

Post.send :include, PostArchetypeQuestion

# Create and Register new Archetype
class QuestionArchetype < RegularTopicArchetype; end
arch = QuestionArchetype.new('question', {capabilities: [:searchable, :shown_publicly, :linkable, :creatible]})
Archetype.register('question', { archetype: arch })
