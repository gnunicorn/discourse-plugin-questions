
Discourse.QuestionBigLikeView = Discourse.View.extend({
    templateName: "big_like",

    insertLikesView: function() {
        var view = this;
        if (view.state === "inDOM") return;

        Ember.run.schedule('afterRender', this, function(){
            var target = view._parentView.$("article .row");
            if (target.length) {
                if (view.state === "preRender") view.createElement();
                target.prepend(view.$());
                // and resize the other boxes, so we do fit, too
                target.find(".span14").removeClass("span14").addClass("span13");
                target.find(".span5").removeClass("span5").addClass("span4");
            }
        });
    }
});

Discourse.PostView.reopen({
    renderQuestionType: function() {
        if (!this.get("post.topic.isQuestion") || this.get("post.post_number") === 1)
            return;

        var subView = this.get("biglikeview");
        if (!subView) {
            subView = this.createChildView(Discourse.QuestionBigLikeView);
            this.set("biglikeview", subView);
        }
        subView.set("context", this.get("post"));
        subView.insertLikesView();
    }.on("postViewInserted")
});

// make detection easier
Discourse.Topic.reopen({
    urlFillerData: function(){
        data = this._super();
        data.push("isQuestion");
        return data;
    }.property(),

    isQuestion: Em.computed.equal('archetype', 'question')
});