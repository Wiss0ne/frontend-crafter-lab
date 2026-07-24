<#assign layout = contentModel.layout_s!''>
<#if !layout?has_content>
  <#assign layout = 'full'>
</#if>

<#assign contentMode = contentModel.contentMode_s!''>
<#if !contentMode?has_content>
  <#assign contentMode = 'overlay'>
</#if>

<#assign theme = contentModel.theme_s!''>
<#if !theme?has_content>
  <#assign theme = 'light'>
</#if>

<#assign desktopContentAlign = contentModel.desktopContentAlign_s!''>
<#if !desktopContentAlign?has_content>
  <#assign desktopContentAlign = 'left'>
</#if>

<#assign mobileContentAlign = contentModel.mobileContentAlign_s!''>
<#if !mobileContentAlign?has_content>
  <#assign mobileContentAlign = 'center'>
</#if>

<#assign showButtons = contentModel.showButtons_b!true>
<#assign customButtonPosition = contentModel.customButtonPosition_b!false>
<#assign hasPrimaryButton = (contentModel.primaryButtonLabel_s!'')?has_content>
<#assign hasSecondaryButton = (contentModel.secondaryButtonLabel_s!'')?has_content>
<#assign hasButtons = showButtons && (hasPrimaryButton || hasSecondaryButton)>
<#assign renderCustomButtons = hasButtons && (customButtonPosition || contentMode == 'image-only')>

<#macro heroActions custom=false>
  <div
    class="honor-hero-slide__actions<#if custom> honor-hero-slide__actions--custom</#if>"
  >
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
</#macro>

<article
  class="
    honor-hero-slide
    honor-hero-slide--${layout}
    honor-hero-slide--${theme}
    honor-hero-slide--${contentMode}
    <#if isActive?? && isActive>is-active</#if>
  "
  style="
    --hero-content-x: ${contentModel.desktopContentX_f!8}%;
    --hero-content-y: ${contentModel.desktopContentY_f!14}%;
    --hero-content-offset-x: ${contentModel.desktopContentOffsetX_i!0}px;
    --hero-content-offset-y: ${contentModel.desktopContentOffsetY_i!0}px;
    --hero-mobile-content-x: ${contentModel.mobileContentX_f!50}%;
    --hero-mobile-content-y: ${contentModel.mobileContentY_f!8}%;
    --hero-mobile-content-offset-x: ${contentModel.mobileContentOffsetX_i!0}px;
    --hero-mobile-content-offset-y: ${contentModel.mobileContentOffsetY_i!0}px;
    --hero-button-x: ${contentModel.desktopButtonX_f!50}%;
    --hero-button-y: ${contentModel.desktopButtonY_f!82}%;
    --hero-button-offset-x: ${contentModel.desktopButtonOffsetX_i!0}px;
    --hero-button-offset-y: ${contentModel.desktopButtonOffsetY_i!0}px;
    --hero-mobile-button-x: ${contentModel.mobileButtonX_f!50}%;
    --hero-mobile-button-y: ${contentModel.mobileButtonY_f!82}%;
    --hero-mobile-button-offset-x: ${contentModel.mobileButtonOffsetX_i!0}px;
    --hero-mobile-button-offset-y: ${contentModel.mobileButtonOffsetY_i!0}px;
  "
  data-hero-slide
  aria-hidden="<#if isActive?? && isActive>false<#else>true</#if>"
>
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

  <#if contentMode == 'overlay'>
    <div
      class="
        honor-hero-slide__content
        honor-hero-slide__content--${theme}
        honor-hero-slide__content--desktop-${desktopContentAlign}
        honor-hero-slide__content--mobile-${mobileContentAlign}
      "
    >
      <#if (contentModel.eyebrow_s!'')?has_content>
        <p class="honor-eyebrow">
          ${contentModel.eyebrow_s}
        </p>
      </#if>

      <h2>${contentModel.title_t!''}</h2>

      <#if (contentModel.tagline_t!'')?has_content>
        <p class="honor-hero-slide__tagline">
          ${contentModel.tagline_t}
        </p>
      </#if>

      <#if hasButtons && !customButtonPosition>
        <@heroActions />
      </#if>
    </div>
  <#elseif (contentModel.title_t!'')?has_content>
    <h2 class="honor-visually-hidden">${contentModel.title_t}</h2>
  </#if>

  <#if renderCustomButtons>
    <@heroActions custom=true />
  </#if>
</article>
