import {configureStore} from '@reduxjs/toolkit';
import loggedReducer from './Slice';
//store
export default configureStore({
    reducer:{
        logged:loggedReducer //logged is name of store
    }
})