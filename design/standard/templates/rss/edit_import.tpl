<form action={"rss/edit_import"|ezurl} method="post" name="RSSImport">

<table class="layout" width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td valign="top">
    <!-- Main part start -->
    <div class="maincontentheader">
    <h1>{"RSS Import"|i18n("design/standard/rss/edit")}</h1>
    </div>

    <div class="block">
    
    <input type="hidden" name="RSSImport_ID" value={$rss_import_id} />

    <label>{"Title"|i18n("design/standard/rss/edit")}:</label><div class="labelbreak"></div>
    {include uri="design:gui/lineedit.tpl" id_name=name value=$rss_import.name|wash}
    <br/>

    <label>{"URL"|i18n("design/standard/rss/edit")}:</label><div class="labelbreak"></div>
    {include uri="design:gui/lineedit.tpl" id_name=url value=$rss_import.url|wash}
    <br/>
    
    <label>{"Destination path"|i18n("design/standard/rss/edit")}:</label><div class="labelbreak"></div>
    <input type="text" readonly="readonly" size="45" value="{$rss_import.destination_path|wash}" maxlength="60" />
    {include uri="design:gui/button.tpl" id_name="DestinationBrowse" value="Browse"|i18n("design/standard/rss/edit")}
    <br/>
    
    <label>{"Imported objects owner"|i18n("design/standard/rss/edit")}:</label><div class="labelbreak"></div>
    {content_view_gui view=text_linked content_object=$rss_import.object_owner.contentobject}
    {include uri="design:gui/button.tpl" id_name="UserBrowse" value="Select"|i18n("design/standard/rss/edit")}
    <br/>

    <label>{"Class"|i18n("design/standard/rss/edit")}:</label><div class="labelbreak"></div>
    <select name="Class_ID">
    {section name=ContentClass loop=$rss_class_array }
    <option
      {section name=Class show=eq($:item.id,$rss_import.class_id)}
        selected="selected"
      {/section} value="{$:item.id}">{$:item.name|wash}
    </option>
    {/section}
    </select>
    {include uri="design:gui/button.tpl" id_name="Update_Class" value="Update"|i18n("design/standard/rss/edit")}
    <br/>

    <label>{"Title"|i18n("design/standard/rss/edit")}:</label><div class="labelbreak"></div>
    <select name="Class_Attribute_Title">
    {section name=ClassAttribute loop=$rss_import.class_attributes}
    <option value="{$:item.identifier|wash}" 
      {section name=ShowSelected show=eq($rss_import.class_title,$:item.identifier)}
        selected="selected"
      {/section}>{$:item.name|wash}
    </option>
    {/section}
    <option value="-1"
      {section name=ShowSelected show=eq($rss_import.class_title,-1)}
        selected="selected"
      {/section}>{"Ignore"|i18n("design/standard/rss/edit")}</option>
    </select>
    <br/>

    <label>{"URL"|i18n("design/standard/rss/edit")}:</label><div class="labelbreak"></div>
    <select name="Class_Attribute_Link">
    {section name=ClassAttribute loop=$rss_import.class_attributes}
    <option value="{$:item.identifier|wash}" 
      {section name=ShowSelected show=eq($rss_import.class_url,$:item.identifier)}
        selected="selected"
      {/section}>{$:item.name|wash}
    </option>
    {/section}
    <option value="-1"
      {section name=ShowSelected show=eq($rss_import.class_url,-1)}
        selected="selected"
      {/section}>{"Ignore"|i18n("design/standard/rss/edit")}</option>
    </select>
    <br/>

    <label>{"Description"|i18n("design/standard/rss/edit")}:</label><div class="labelbreak"></div>
    <select name="Class_Attribute_Description">
    {section name=ClassAttribute loop=$rss_import.class_attributes}
    <option value="{$:item.identifier|wash}" 
      {section name=ShowSelected show=eq($rss_import.class_description,$:item.identifier)}
        selected="selected"
      {/section}>{$:item.name|wash}
    </option>
    {/section}
    <option value="-1"
      {section name=ShowSelected show=eq($rss_import.class_description,-1)}
        selected="selected"
      {/section}>{"Ignore"|i18n("design/standard/rss/edit")}</option>
    </select>
    <br/>
    <label>{"Active"|i18n("design/standard/rss/edit")}:</label><div class="labelbreak"></div>
    <input type="checkbox" name="active" {section show=$rss_import.active|eq(1)}checked="checked"{/section}>{"Active"|i18n("design/standard/rss/edit")}</input>
    <br/>


    <div class="buttonblock">
    <input class="defaultbutton" type="submit" name="StoreButton" value="{'Store'|i18n('design/standard/rss/edit')}" />
    <input class="button" type="submit" name="RemoveButton" value="{'Remove'|i18n('design/standard/rss/edit')}" />
    </div>
    <!-- Main part end -->
    </td>
</tr>
</table>
</form>
