import React from 'react';
import { Route, Switch } from 'react-router-dom'
import Home from './reactHome/ReactHome'
import ReactNote from './reactNote/ReactNote'

const App = () => {
    return (
        /* Set up an exact path which we want to route the component to*/
        <Switch>
            <Route exact path="/" component={Home} /> 
            <Route exact path="/reactnote" component={ReactNote} />
        </Switch>
    )
}

export default App