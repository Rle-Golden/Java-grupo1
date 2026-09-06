import React from 'react';

const NavBarAdministrador = () => {
    return (
        <div>
            <nav className="menu-bar">
                <div>
                    <img src="../Img/logo_texto_trasparente.png" alt="Logo de ObrasAIR" />
                    <div className="logo-texto">ObrasAIR</div>
                </div>

                <ul>
                    <li><a href="./Views/Administrador/Index.Js">Inicio</a></li>
                    <li><a href="./Views/Administrador/OfertadEmpleo.Js">Ofertas De Empleo</a></li>
                    <li><a href="./Views/Administrador/Usuarios.Js">Usuarios</a></li>
                    <li><a href="./Views/PerfilUsuario.Js">Mi Perfil</a></li>
                    <li><a href="./Views/CierreSesion.Js">Cerrar Sesion</a></li>
                </ul>
            </nav>
        </div>
    );
};

export default NavBarAdministrador;
