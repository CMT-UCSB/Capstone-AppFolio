import React from 'react';
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import reactHome from '../components/reactHome';

import "bootstrap";

import "../../assets/stylesheets/css/black-dashboard-react.css";
import "../../assets/stylesheets/nucleo-icons.css";

export default (
  <Router>
    <Switch>
      <Route path="/reactHome" exact component={reactHome} />
    </Switch>
  </Router>
);