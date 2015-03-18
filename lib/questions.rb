require 'questions/engine'

module Questions
  module QuestionsLikeResorter
    def self.included(klass)
      klass.after_save :resort_for_likes
    end

    def resort_for_likes
      return unless is_like?
      return unless post.topic.archetype == ::QUESTION_ARCHETYPE_NAME
      posts = Post.where(topic_id: post.topic_id).where("post_number != 1").order("like_score desc")
      # the first one shall always be on top, so we add + 1 to all other posts
      Post.transaction do
        posts.each_with_index do |post, index|
          post.sort_order = index + 1
          post.save()
        end
      end
    end
  end
end
