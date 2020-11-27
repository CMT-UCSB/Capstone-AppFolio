import React from 'react';
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import reactHome from "../components/reactHome";

import "bootstrap";

import "../../assets/stylesheets/black-dashboard-react.scss";
import "../../assets/stylesheets/nucleo-icons.css";

export default (
  <Router>
    <Switch>
      <Route path="/reactHome" exact component={reactHome} />
    </Switch>
  </Router>
)
