<article
  class="
    honor-hero-slide
    honor-hero-slide--${contentModel.layout_s!'full'}
    honor-hero-slide--${contentModel.theme_s!'light'}
    <#if isActive?? && isActive>is-active</#if>
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

  <div class="honor-hero-slide__content">
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

    <div class="honor-hero-slide__actions">
      <#if (contentModel.primaryButtonLabel_s!'')?has_content>
        <a
          class="honor-button honor-button--dark"
          href="${contentModel.primaryButtonUrl_s!'#'}"
        >
          ${contentModel.primaryButtonLabel_s}
        </a>
      </#if>

      <#if (contentModel.secondaryButtonLabel_s!'')?has_content>
        <a
          class="honor-text-link"
          href="${contentModel.secondaryButtonUrl_s!'#'}"
        >
          ${contentModel.secondaryButtonLabel_s}
        </a>
      </#if>
    </div>
  </div>
</article>