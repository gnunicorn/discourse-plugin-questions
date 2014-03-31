
Discourse.QuestionBigLikeView = Discourse.View.extend({
    templateName: "big_like",

    insertLikesView: function() {
        var view = this;
        if (view.state === "inDOM") return;

        Ember.run.schedule('afterRender', this, function(){
            var target = view._parentView.$("article .row");
            console.log(this.get("likes"));
            console.log(this.get("context"));
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
        if (this.get("post.topic.archetype") != "question") return
        if (this.get("post.post_number") === 1) return;

        var subView = this.get("biglikeview");
        if (!subView) {
            subView = this.createChildView(Discourse.QuestionBigLikeView);
            this.set("biglikeview", subView);
        }
        subView.set("context", this.get("post"));
        subView.insertLikesView();
    }.on("postViewInserted")
});

console.log("yes, yup. yeah, yes");