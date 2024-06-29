document.getElementById('mostrarMaisBtn').addEventListener('click', function() {
    var camposAdicionais = document.getElementById('camposAdicionais');
    if (camposAdicionais.style.display === 'none') {
      camposAdicionais.style.display = 'block';
      this.textContent = 'Formulário simplificado';
    } else {
      camposAdicionais.style.display = 'none';
      this.textContent = 'Formulário completo';
    }
  });