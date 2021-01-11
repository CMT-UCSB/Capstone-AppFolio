import React from 'react';
import { Route, Switch } from 'react-router-dom'
import Home from './reactHome/ReactHome'

const App = () => {
    return (
        /* Set up an exact path which we want to route the component to*/
        <Switch>
            <Route exact path="/" component={Home} /> 
        </Switch>
    )
}

export default App