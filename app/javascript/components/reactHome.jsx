import React from 'react';

import Sidebar from './Sidebar/Sidebar.js'


class reactHome extends React.Component {
    render () {
        return (
            <Sidebar
                // this is necessary so we can check for the active link
                {...this.props}
                routes={routes}
                bgColor={this.state.backgroundColor}
                logo={{
                innerLink: "https://www.creative-tim.com/",
                text: "Creative Tim",
                imgSrc: logo
                }}
                // this is necessary so we can close the menu, when a users goes to another page
            />
        );
    }
}

export default reactHome