package ejemplo.aspectos;

public aspect AspectoCuenta {
	
    final int MIN_BALANCE = 10;
 
    // pointcut que hace referencia a Cuenta.retirar
    pointcut llamadoARetirar(int valor, Cuenta cuenta) : 
     call(boolean Cuenta.retirar(int)) && args(valor) && target(cuenta);
 
    // antes de ejecutar el método
    before(int valor, Cuenta cuenta) : llamadoARetirar(valor, cuenta) {
    }
 
    // en lugar de ejecutar el método
    boolean around(int valor, Cuenta cuenta) : llamadoARetirar(valor, cuenta) {
        if (cuenta.balance - valor < MIN_BALANCE) {
            return false;
        }
        return proceed(valor, cuenta);
    }
 
    // después de ejecutar el método
    after(int valor, Cuenta cuenta) : llamadoARetirar(valor, cuenta) {
    }
}