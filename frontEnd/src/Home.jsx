import { useEffect } from "react";
import { useNavigate } from "react-router-dom";
import { useAuth } from './AuthContext';
import Link from "./Apiconf";

export default function Home() {
    const {setRol } = useAuth();
    const navigate = useNavigate();
    useEffect(() => {
        fetch(Link, {
            method: 'GET',
            credentials: 'include',
            headers: {
                'Access-Control-Allow-Origin': '*', 
                'Content-Type': 'application/json'
            }
        })
        .then(response => response.json())
        .then(data => {
            console.log(data);
            if(data.valid){
                setRol(data.rol);
                if(data.rol === "Operario") {
                    navigate('/operario');
                } else if(data.rol === "Admin") {
                    navigate('/admin');
                }
            } else {
                navigate('/login');
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
     
    }, [navigate, setRol]);
    return null;
}