import React from 'react'

const NavBarAdministrador = () => {

    return (
        <div>
            <nav className="menu-bar">
                <div>
                    <image src="../Img/logo_texto_trasparente.png" alt="Logo" className="logo-imagen"/>
                    <div class="logo-texto">ObrasAIR</div>
                </div>

                <ul>
                    <li><a href="../Views/Administrador/Index.Js">Inicio</a></li>
                    <li><a href="../Views/Administrador/OfertadEmpleo.Js">Ofertas De empleo</a></li>
                    <li><a href="../Views/Administrador/Usuarios.Js">Usuarios</a></li>
                    <li><a href="../Views/PerfilUsuario.Js">Mi Perfil</a></li>
                </ul>
            </nav>
        </div>
    )

}

export default NavBarAdministrador
