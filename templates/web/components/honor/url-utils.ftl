<#ftl output_format="HTML" auto_esc=true>

<#-- Allow only ordinary web URLs, site-relative paths and fragment links. -->
<#function safe value="">
  <#local candidate = value?string?trim>
  <#local lowerCandidate = candidate?lower_case>

  <#if lowerCandidate?starts_with("https://")
    || lowerCandidate?starts_with("http://")
    || candidate?starts_with("#")
    || (candidate?starts_with("/") && !candidate?starts_with("//"))>
    <#return candidate>
  </#if>

  <#return "#">
</#function>
