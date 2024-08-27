import { useNavigate } from "react-router-dom";
import { useDispatch } from "react-redux";
import { logout } from "./Slice";
import { useEffect } from "react";
export default function LogoutComp(){
    
    const navigate = useNavigate();
    const dispatch = useDispatch();

    useEffect(()=>{
    localStorage.clear();
    dispatch(logout());  //loggedin
    console.log("in logout component");
    navigate('/');
    },[]);
}
