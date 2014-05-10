(function(){
    Discourse.QRadioButton = Ember.View.extend({
            tagName : "input",
            type : "radio",
            attributeBindings : [ "name", "type", "value", "checked:checked:" ],
            click : function() {
                this.set("selection", this.$().val())
            },
            checked : function() {
                return this.get("value") == this.get("selection");
            }.property()
        });

    Discourse.Composer.reopen({
         archetypeSelectable: function() {
                return this.get('action') === "createTopic";
            }.property("action")
    });
})()