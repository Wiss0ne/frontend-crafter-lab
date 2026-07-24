<#assign layoutPreset = contentModel.layoutPreset_s!''>
<#if !layoutPreset?has_content>
  <#assign legacyContentMode = contentModel.contentMode_s!''>
  <#assign legacyName = (contentModel["internal-name"]!'')?lower_case>

  <#if legacyContentMode == 'image-only'>
    <#assign layoutPreset = 'image-only'>
  <#elseif legacyName?contains('magic v6')>
    <#assign layoutPreset = 'magic-v6'>
  <#elseif legacyName?contains('magic v5')>
    <#assign layoutPreset = 'magic-v5'>
  <#elseif legacyName?contains('watch 5 ultra')>
    <#assign layoutPreset = 'watch-5-ultra'>
  <#else>
    <#assign layoutPreset = 'generic-left'>
  </#if>
</#if>

<#assign theme = contentModel.theme_s!''>
<#if !theme?has_content>
  <#assign theme = 'light'>
</#if>

<#assign showButtons = contentModel.showButtons_b!true>
<#assign hasPrimaryButton = (contentModel.primaryButtonLabel_s!'')?has_content>
<#assign hasSecondaryButton = (contentModel.secondaryButtonLabel_s!'')?has_content>
<#assign hasButtons = showButtons && (hasPrimaryButton || hasSecondaryButton)>

<#macro heroPicture>
  <picture class="honor-hero-slide__picture">
    <#if (contentModel.mobileImage_s!'')?has_content>
      <source
        media="(max-width: 820px)"
        srcset="${contentModel.mobileImage_s}"
      >
    </#if>

    <#if (contentModel.desktopImage_s!'')?has_content>
      <img
        class="honor-hero-slide__visual"
        src="${contentModel.desktopImage_s}"
        alt="${contentModel.title_t!''}"
      >
    </#if>
  </picture>
</#macro>

<#macro heroActions>
  <#if hasButtons>
    <div class="honor-hero-slide__actions">
      <#if hasPrimaryButton>
        <a
          class="honor-button <#if theme == 'dark'>honor-button--light<#else>honor-button--dark</#if>"
          href="${contentModel.primaryButtonURL_s!'#'}"
        >
          ${contentModel.primaryButtonLabel_s}
        </a>
      </#if>

      <#if hasSecondaryButton>
        <a
          class="honor-text-link<#if theme == 'dark'> honor-text-link--light</#if>"
          href="${contentModel.secondaryButtonURL_s!'#'}"
        >
          ${contentModel.secondaryButtonLabel_s}
        </a>
      </#if>
    </div>
  </#if>
</#macro>

<#macro heroCopy>
  <#if (contentModel.eyebrow_s!'')?has_content>
    <p class="honor-eyebrow">${contentModel.eyebrow_s}</p>
  </#if>

  <#if (contentModel.title_t!'')?has_content>
    <h2>${contentModel.title_t}</h2>
  </#if>

  <#if (contentModel.tagline_t!'')?has_content>
    <p class="honor-hero-slide__tagline">${contentModel.tagline_t}</p>
  </#if>

  <@heroActions />
</#macro>

<#macro heroHiddenTitle>
  <#if (contentModel.title_t!'')?has_content>
    <h2 class="honor-visually-hidden">${contentModel.title_t}</h2>
  </#if>
</#macro>

<article
  class="
    honor-hero-slide
    honor-hero-slide--full
    honor-hero-slide--${theme}
    honor-hero-slide--preset-${layoutPreset}
    <#if isActive?? && isActive>is-active</#if>
  "
  data-hero-slide
  data-hero-preset="${layoutPreset}"
  aria-hidden="<#if isActive?? && isActive>false<#else>true</#if>"
>
  <#switch layoutPreset>
    <#case 'magic-v5'>
      <#include "/templates/web/components/honor/hero/presets/magic-v5.ftl">
      <#break>
    <#case 'magic-v6'>
      <#include "/templates/web/components/honor/hero/presets/magic-v6.ftl">
      <#break>
    <#case 'watch-5-ultra'>
      <#include "/templates/web/components/honor/hero/presets/watch-5-ultra.ftl">
      <#break>
    <#case 'image-only'>
      <#include "/templates/web/components/honor/hero/presets/image-only.ftl">
      <#break>
    <#default>
      <#include "/templates/web/components/honor/hero/presets/generic.ftl">
  </#switch>
</article>
