<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email'); section>
    <#if section = "header">
        ${msg("updateProfileTitle")}
    <#elseif section = "form">
        <div class="form-wrapper">
            <form id="kc-update-profile-form" action="${url.loginAction}" method="post">
                <div class="form-row">
                    <div class="form-group">
                        <label for="username" class="control-label">${msg("username")}</label>
                        <div class="input-group">
                            <span class="input-icon user-icon"></span>
                            <input type="text" id="username" name="username" value="${(username!'')}"
                                class="form-control" disabled
                            />
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="firstName" class="control-label">${msg("firstName")} *</label>
                        <div class="input-group">
                            <span class="input-icon user-icon"></span>
                            <input type="text" id="firstName" name="firstName" value="${(user.firstName!'')}"
                                class="form-control ${messagesPerField.printIfExists('firstName','error')}"
                                aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                            />
                        </div>
                        <#if messagesPerField.existsError('firstName')>
                            <span class="error-message" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div class="form-group">
                        <label for="lastName" class="control-label">${msg("lastName")} *</label>
                        <div class="input-group">
                            <span class="input-icon user-icon"></span>
                            <input type="text" id="lastName" name="lastName" value="${(user.lastName!'')}"
                                class="form-control ${messagesPerField.printIfExists('lastName','error')}"
                                aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                            />
                        </div>
                        <#if messagesPerField.existsError('lastName')>
                            <span class="error-message" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                            </span>
                        </#if>
                    </div>
                </div>

                <div class="form-group">
                    <label for="email" class="control-label">${msg("email")} *</label>
                    <div class="input-group">
                        <span class="input-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="white">
                                <path d="M20 4H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 14H4V8l8 5 8-5v10zm-8-7L4 6h16l-8 5z"/>
                            </svg>
                        </span>
                        <input type="email" id="email" name="email" value="${(user.email!'')}"
                            class="form-control ${messagesPerField.printIfExists('email','error')}"
                            aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                        />
                    </div>
                    <#if messagesPerField.existsError('email')>
                        <span class="error-message" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('email'))?no_esc}
                        </span>
                    </#if>
                </div>

                <div class="form-buttons">
                    <input class="login-btn" type="submit" value="${msg("doSubmit")}" />
                </div>
            </form>
        </div>
    </#if>
</@layout.registrationLayout>