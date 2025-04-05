document.addEventListener('DOMContentLoaded', function() {
    // Register form validation
    const registerForm = document.getElementById('kc-register-form');
    if (registerForm) {
        registerForm.addEventListener('submit', function(e) {
            const password = document.getElementById('password').value;
            const passwordConfirm = document.getElementById('password-confirm').value;
            
            if (password !== passwordConfirm) {
                e.preventDefault();
                alert('The passwords do not match');
            }
        });
    }

    // Password update form validation
    const passwordUpdateForm = document.getElementById('kc-passwd-update-form');
    if (passwordUpdateForm) {
        passwordUpdateForm.addEventListener('submit', function(e) {
            const newPassword = document.getElementById('password-new').value;
            const confirmPassword = document.getElementById('password-confirm').value;
            
            if (newPassword !== confirmPassword) {
                e.preventDefault();
                alert('The passwords do not match');
            }
        });
    }
});