(function(){
    var patcher = window.TemplatePatcher;

    // patcher.setDebug(true);
    // patcher.setFinder('composerMessages');

    var patched = '{{#if model.archetypeSelectable}}{{i18n composer.create}}<label>{{view Discourse.QRadioButton name="archetypeSelection" selectionBinding="model.archetypeId" value="regular"}}{{i18n composer.regular_topic}}</label> <label>{{view Discourse.QRadioButton name="archetypeSelection" selectionBinding="model.archetypeId" value="question"}}{{i18n composer.question}}</label>{{else}}{{{model.actionTitle}}}{{/if}}'

    //wrap outlet into our section, attach aside
    patcher.addGeneralPatcher("f5a96e884170ace97506d3e4ca3eb3d3",
        function(ast, hash, str){
            patcher.replaceWith(ast, 'if[0] [1]', patched);
        });
})();