<form action={concat("/state/edit/", $state.id)|ezurl} method="post">

{if is_set($is_valid)}
{if $is_valid}
    <div class="message-feedback">
        <h2><span class="time">[{currentdate()|l10n( shortdatetime )}]</span> {'The content object state was successfully stored.'|i18n( 'design/admin/state/edit' )}</h2>
    </div>
{else}
    <div class="message-warning">
    <h2><span class="time">[{currentdate()|l10n( shortdatetime )}]</span> {'The content object state could not be stored.'|i18n( 'design/admin/state/edit' )}</h2>
    <p>{'Required data is either missing or is invalid'|i18n( 'design/admin/state/edit' )}:</p>
    <ul>
    {foreach $validation_messages as $message}
    <li>{$message|wash}</li>
    {/foreach}
    </ul>
    </div>
{/if}
{/if}

<div class="context-block">

{* DESIGN: Header START *}<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">

<h1 class="context-title">{'Edit content object state "%state_name"'|i18n('design/admin/state/edit', '', hash( '%state_name', $state.current_translation.name ))|wash}</h1>

{* DESIGN: Mainline *}<div class="header-mainline"></div>

{* DESIGN: Header END *}</div></div></div></div></div></div>

{* DESIGN: Content START *}<div class="box-ml"><div class="box-mr"><div class="box-content">

<div class="block">
<div class="element">
<label>Identifier:</label>
<input type="text" name="ContentObjectState_identifier" style="margin-bottom:1em;" size="80" maxlength="45" value="{$state.identifier|wash}" />
</div>
{if $state.all_translations|count|gt(1)}
<div class="element">
<label>Default language:</label>
<select name="ContentObjectState_default_language_id">
{foreach $state.all_translations as $translation}
<option value="{$translation.language.id}" {if $state.default_language_id|eq($translation.language.id)}selected="selected"{/if}>{$translation.language.locale_object.intl_language_name|wash}</option>
{/foreach}
</select>
</div>
{/if}
<div class="break"></div>
</div>

<div class="block">
{let $translations=$state.all_translations
     $useFieldsets=$translations|count|gt(1)}
    {foreach $translations as $translation}
    {if $useFieldsets}
    <fieldset style="margin-bottom:1em;background-color: #fefefb;">
    <legend><img src="{$translation.language.locale|flag_icon}" /> {$translation.language.locale_object.intl_language_name|wash}</legend>
    {/if}
    <label>Name:</label>
    <input type="text" size="80" maxlength="45" name="ContentObjectState_name[]" value="{$translation.name|wash}" />
    <label>Description:</label>
    <textarea rows="6" name="ContentObjectState_description[]" style="width:99%">{$translation.description|wash}</textarea>
    {if $useFieldsets}
    </fieldset>
    {/if}
    {/foreach}
</div>

{* DESIGN: Content END *}</div></div></div>

<div class="controlbar">
{* DESIGN: Control bar START *}<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-tc"><div class="box-bl"><div class="box-br">
<div class="block">
  <input class="button" type="submit" name="StoreButton" value="{'Save changes'|i18n('design/admin/state/edit')|wash}" title="{'Save changes to this states.'|i18n( 'design/admin/state/edit' )|wash}" />
  <input class="button" type="submit" name="CancelButton" value="{'Cancel'|i18n('design/admin/state/edit')|wash}" title="{'Cancel saving any changes.'|i18n( 'design/admin/state/edit' )|wash}" />
</div>

{* DESIGN: Control bar END *}</div></div></div></div></div></div>

</div>{* class="controlbar" *}

</div>{* class="context-block" *}

</form>