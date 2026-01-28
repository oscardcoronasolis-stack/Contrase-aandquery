<!DOCTYPE html>
<html>
<head>
  <base target="_top">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    
    body {
      font-family: Arial, sans-serif;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    
    .login-container {
      background: white;
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0 10px 25px rgba(0,0,0,0.2);
      width: 100%;
      max-width: 400px;
      text-align: center;
    }
    
    h1 {
      color: #333;
      margin-bottom: 10px;
      font-size: 28px;
    }
    
    .subtitle {
      color: #666;
      margin-bottom: 30px;
      font-size: 14px;
    }
    
    .input-group {
      margin-bottom: 20px;
      text-align: left;
    }
    
    label {
      display: block;
      margin-bottom: 8px;
      color: #555;
      font-weight: bold;
      font-size: 14px;
    }
    
    input[type="password"] {
      width: 100%;
      padding: 12px;
      border: 2px solid #ddd;
      border-radius: 5px;
      font-size: 16px;
      transition: border-color 0.3s;
    }
    
    input[type="password"]:focus {
      outline: none;
      border-color: #667eea;
    }
    
    button {
      width: 100%;
      padding: 12px;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      border: none;
      border-radius: 5px;
      font-size: 16px;
      font-weight: bold;
      cursor: pointer;
      transition: transform 0.2s;
    }
    
    button:hover {
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
    }
    
    button:active {
      transform: translateY(0);
    }
    
    .error {
      color: #e74c3c;
      margin-top: 15px;
      font-size: 14px;
      display: none;
    }
    
    .lock-icon {
      font-size: 60px;
      margin-bottom: 20px;
    }
  </style>
</head>
<body>
  <div class="login-container">
    <div class="lock-icon">🔒</div>
    <h1>Dashboard Ventas</h1>
    <p class="subtitle">Acceso restringido - Ingrese su contraseña</p>
    
    <form id="loginForm">
      <div class="input-group">
        <label for="password">Contraseña:</label>
        <input 
          type="password" 
          id="password" 
          name="password" 
          placeholder="Ingrese la contraseña"
          required
        >
      </div>
      
      <button type="submit">Ingresar</button>
      
      <p class="error" id="errorMsg">❌ Contraseña incorrecta</p>
    </form>
  </div>
  
  <script>
    // Enfocar el campo de contraseña después de cargar
    setTimeout(function() {
      document.getElementById('password').focus();
    }, 100);
    
    document.getElementById('loginForm').addEventListener('submit', function(e) {
      e.preventDefault();
      
      var password = document.getElementById('password').value;
      var currentUrl = window.location.href.split('?')[0];
      
      // Redirigir con la contraseña
      window.location.href = currentUrl + '?pass=' + encodeURIComponent(password);
    });
    
    // Mostrar error si viene de intento fallido
    if (window.location.href.includes('?pass=')) {
      document.getElementById('errorMsg').style.display = 'block';
      document.getElementById('password').value = '';
    }
  </script>
</body>
</html>
