
// make detection easier
Discourse.Topic.reopen({
    urlForPostNumber: function(post_number) {
        // on questions, the posts order changes and therefore the links
        // using counters are broken. Don't pretend this
        if (!this.get("isQuestion")) return this._super(post_number);
        return this.get("url");
    },

    isQuestion: Em.computed.equal('archetype', 'question')
});