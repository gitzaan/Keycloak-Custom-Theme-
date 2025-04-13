<#import "template.ftl" as layout>
<@layout.registrationLayout displayRequiredFields=false; section>
    <#if section = "header">
        ${msg("loginTotpTitle")}
    <#elseif section = "form">
        <div class="totp-container">
            <div class="totp-instructions">
                <ol id="kc-totp-settings" class="compact-list">
                    <li>
                        <span class="step-label">${msg("loginTotpStep1")}</span>
                        <div class="app-suggestions">
                            <#if totp.policy?? && totp.policy.supportedApplications?? && totp.policy.supportedApplications?has_content>
                                <#list totp.policy.supportedApplications as app>
                                    <span class="app-badge">${app}</span>
                                </#list>
                            <#else>
                                <span class="app-badge">Google Authenticator</span>
                                <span class="app-badge">Microsoft Authenticator</span>
                            </#if>
                        </div>
                    </li>

                    <li>
                        <span class="step-label">${msg("loginTotpStep2")}</span>
                        <div class="qr-code-section">
                            <img id="kc-totp-secret-qr-code" src="data:image/png;base64, ${totp.totpSecretQrCode}" alt="QR Code" />
                            <div class="manual-setup">
                                <span class="key-label">${msg("loginTotpManualStep2")}</span> 
                                <span id="kc-totp-secret-key">${totp.totpSecretEncoded}</span>
                            </div>
                        </div>
                    </li>

                    <li>
                        <span class="step-label">${msg("loginTotpStep3")}</span>
                    </li>
                </ol>
            </div>

            <form action="${url.loginAction}" id="kc-totp-settings-form" method="post" class="compact-form">
                <div class="form-group">
                    <label for="totp" class="control-label">${msg("authenticatorCode")}</label>
                    <input type="text" id="totp" name="totp" autocomplete="off" class="form-control" autofocus inputmode="numeric" pattern="[0-9]*" />
                </div>

                <div class="form-group">
                    <label for="userLabel" class="control-label">${msg("loginTotpDeviceName")}</label>
                    <input type="text" id="userLabel" name="userLabel" autocomplete="off" class="form-control" />
                </div>

                <input type="hidden" id="totpSecret" name="totpSecret" value="${totp.totpSecret}" />

                <div class="form-group">
                    <input class="login-btn" type="submit" value="${msg("doSubmit")}" />
                </div>
            </form>
        </div>
    </#if>
</@layout.registrationLayout>