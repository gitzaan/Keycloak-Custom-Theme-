<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">
        <p>Siveillance Access Registration</p>
        
        <form id="kc-register-form" action="${url.registrationAction}" method="post">
            <div class="form-group">
                <label for="firstName" class="control-label">${msg("firstName")}</label>
                <input type="text" id="firstName" class="form-control" name="firstName" value="${(register.formData.firstName!'')}" autofocus />
            </div>

            <div class="form-group">
                <label for="lastName" class="control-label">${msg("lastName")}</label>
                <input type="text" id="lastName" class="form-control" name="lastName" value="${(register.formData.lastName!'')}" />
            </div>

            <div class="form-group">
                <label for="email" class="control-label">${msg("email")}</label>
                <input type="text" id="email" class="form-control" name="email" value="${(register.formData.email!'')}" autocomplete="email" />
            </div>

            <#if !realm.registrationEmailAsUsername>
                <div class="form-group">
                    <label for="username" class="control-label">${msg("username")}</label>
                    <input type="text" id="username" class="form-control" name="username" value="${(register.formData.username!'')}" autocomplete="username" />
                </div>
            </#if>

            <div class="form-group">
                <label for="password" class="control-label">${msg("password")}</label>
                <input type="password" id="password" class="form-control" name="password" autocomplete="new-password" />
            </div>

            <div class="form-group">
                <label for="password-confirm" class="control-label">${msg("passwordConfirm")}</label>
                <input type="password" id="password-confirm" class="form-control" name="password-confirm" />
            </div>

            <div id="kc-form-buttons" class="form-group">
                <input class="login-btn" type="submit" value="${msg("doRegister")}"/>
            </div>
            
            <div class="back-link-container">
                <a href="${url.loginUrl}" class="back-link">${msg("backToLogin")}</a>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>