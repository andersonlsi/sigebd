// Definir tempo para fechar o alerta automaticamente (em milissegundos)
const closeTime = 5000; // 5000ms = 5 segundos
let remainingTime = closeTime / 1000; // tempo restante em segundos

// Função para atualizar a contagem regressiva
function updateCountdown() {
    document.getElementById('countdown').innerText = ` Fechando alerta em ${remainingTime} segundos...`;
    remainingTime--;
}

// Função para acionar o clique no botão de fechar
function autoCloseAlert() {
    document.getElementById('close-alert').click();
}

// Atualizar a contagem regressiva a cada segundo
const countdownInterval = setInterval(updateCountdown, 1000);

// Acionar o fechamento automático após o tempo definido
setTimeout(() => {
    clearInterval(countdownInterval); // Parar a contagem regressiva
    autoCloseAlert(); // Fechar o alerta
}, closeTime);

// Iniciar a contagem regressiva imediatamente
updateCountdown();