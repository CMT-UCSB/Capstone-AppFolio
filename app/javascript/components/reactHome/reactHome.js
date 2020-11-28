import React, {useState} from 'react'
import Header from './Header/Header'
import Sidebar from './Sidebar/Sidebar'
import Main from './Main/Main'
import About from './About/About'
import Team from './Team/Team'
import FAQ from './FAQ/FAQ'



const Home = () => {
    const [isOpen, setIsOpen] = useState(false)     // default to false

    const toggle = () => {
        setIsOpen(!isOpen)
    }

    return (
        <div>
            <Sidebar isOpen={isOpen} toggle={toggle} />     {/* pass in isOpen and toggle */}
            <Header toggle={toggle} />
            <Main />
            <About />
            <Team />
            <FAQ />
        </div>
    )
}

export default Home