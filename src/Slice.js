import { createSlice } from "@reduxjs/toolkit"
//slice
export const loggedSlice = createSlice({
    name: "logged",
    initialState: {
        loggedIn: false
    },
    reducers: {
        login: (state) => { console.log("In login action"); return { loggedIn: true } },

        logout: (state) => { console.log("In logout action"); return { loggedIn: false } },
    }
})

export const { login, logout } = loggedSlice.actions
export default loggedSlice.reducer