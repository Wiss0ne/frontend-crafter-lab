<#ftl output_format="HTML" auto_esc=true>
<#import "/templates/web/components/honor/url-utils.ftl" as honorUrl />
<#-- HONOR marketing content card; layout is selected by a code-owned preset. -->
<#assign preset = contentModel.layoutPreset_s!'product-standard'>
<#assign theme = contentModel.theme_s!'light'>
<#assign primaryImage = contentModel.primaryImage_s!''>
<#assign secondaryImage = contentModel.secondaryImage_s!''>
<#assign hasPrimaryAction = (contentModel.primaryButtonLabel_s!'')?has_content>
<#assign hasSecondaryAction = (contentModel.secondaryButtonLabel_s!'')?has_content>

<#macro actions light=false className='honor-content-card__actions'>
  <#if hasPrimaryAction || hasSecondaryAction>
    <div class="${className}">
      <#if hasPrimaryAction>
        <a
          class="honor-button <#if light>honor-button--light<#else>honor-button--dark</#if>"
          href="${honorUrl.safe(contentModel.primaryButtonURL_s!'#')}"
        >${contentModel.primaryButtonLabel_s}</a>
      </#if>
      <#if hasSecondaryAction>
        <a
          class="honor-text-link<#if light> honor-text-link--light</#if>"
          href="${honorUrl.safe(contentModel.secondaryButtonURL_s!'#')}"
        >${contentModel.secondaryButtonLabel_s} <span>›</span></a>
      </#if>
    </div>
  </#if>
</#macro>

<#macro featureBanner variant='balanced'>
  <section
    id="${contentModel.anchorId_s!'honor-feature'}"
    class="honor-magic8 honor-magic8--${variant}"
  >
    <div class="honor-magic8__copy">
      <#if (contentModel.eyebrow_s!'')?has_content>
        <p class="honor-eyebrow">${contentModel.eyebrow_s}</p>
      </#if>
      <h2>${contentModel.title_t!''}</h2>
      <#if (contentModel.tagline_t!'')?has_content>
        <p>${contentModel.tagline_t}</p>
      </#if>
      <@actions light=(theme == 'dark') className='honor-magic8__actions' />
    </div>
    <#if primaryImage?has_content>
      <img
        class="honor-magic8__phone honor-magic8__phone--left"
        src="${honorUrl.safe(primaryImage)}"
        alt="${(contentModel.primaryImageAlt_s)!(contentModel.title_t!'')}"
      >
    </#if>
    <#if secondaryImage?has_content>
      <img
        class="honor-magic8__phone honor-magic8__phone--right"
        src="${honorUrl.safe(secondaryImage)}"
        alt="${(contentModel.secondaryImageAlt_s)!(contentModel.title_t!'')}"
      >
    </#if>
  </section>
</#macro>

<#switch preset>
  <#case 'feature-magic8'>
    <@featureBanner variant='magic8' />
    <#break>

  <#case 'feature-600-lite'>
    <@featureBanner variant='600-lite' />
    <#break>

  <#case 'feature-banner'>
    <@featureBanner />
    <#break>

  <#case 'event-orb'>
    <article class="honor-event-card">
      <div class="honor-event-card__copy">
        <#if (contentModel.eyebrow_s!'')?has_content>
          <p class="honor-event-card__date">${contentModel.eyebrow_s}</p>
        </#if>
        <h3>${contentModel.title_t!''}</h3>
        <#if (contentModel.tagline_t!'')?has_content>
          <p>${contentModel.tagline_t}</p>
        </#if>
        <@actions light=true />
      </div>
      <div class="honor-event-card__orb" aria-hidden="true"></div>
      <div class="honor-event-card__ribbons" aria-hidden="true">
        <span></span><span></span><span></span>
      </div>
    </article>
    <#break>

  <#case 'technology-camera'>
    <article class="honor-tech-card honor-tech-card--camera">
      <div class="honor-tech-card__copy">
        <p>${contentModel.eyebrow_s!''}</p>
        <h3>${contentModel.title_t!''}</h3>
        <@actions light=true />
      </div>
      <div class="honor-tech-card__lens" aria-hidden="true"></div>
    </article>
    <#break>

  <#case 'technology-ai'>
    <article class="honor-tech-card honor-tech-card--ai">
      <div class="honor-tech-card__copy">
        <p>${contentModel.eyebrow_s!''}</p>
        <h3>${contentModel.title_t!''}</h3>
        <@actions />
      </div>
      <span class="honor-tech-card__star" aria-hidden="true">✦</span>
      <span class="honor-tech-card__star honor-tech-card__star--small" aria-hidden="true">✦</span>
    </article>
    <#break>

  <#default>
    <#assign isWide = (contentModel.cardSize_s!'standard') == 'wide'>
    <article
      class="honor-product-card<#if isWide> honor-product-card--wide</#if><#if theme == 'violet'> honor-product-card--violet</#if>"
      data-product-category="${contentModel.category_s!'all'}"
    >
      <div class="honor-product-card__copy">
        <#if (contentModel.eyebrow_s!'')?has_content>
          <p class="honor-product-card__type">${contentModel.eyebrow_s}</p>
        </#if>
        <h3>${contentModel.title_t!''}</h3>
        <#if (contentModel.tagline_t!'')?has_content>
          <p>${contentModel.tagline_t}</p>
        </#if>
        <@actions />
      </div>
      <#if primaryImage?has_content>
        <img
          <#if isWide>class="honor-product-card__phone"</#if>
          src="${honorUrl.safe(primaryImage)}"
          alt="${(contentModel.primaryImageAlt_s)!(contentModel.title_t!'')}"
        >
      <#elseif theme == 'violet'>
        <div class="honor-product-card__tablet" aria-hidden="true"><span></span></div>
      </#if>
    </article>
</#switch>
