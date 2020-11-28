import React from 'react';
import { FaBars } from 'react-icons/fa'
import { Nav, NavbarContainer, NavLogo, MobileIcon, NavMenu, NavItem, NavLinks, NavBtnList, NavBtn, NavBtnLink } from './HeaderElements'



const Header = ( {toggle} ) => {
    return (
        <>
            <Nav>
                <NavbarContainer>
                    <NavLogo to='home'>Synergi</NavLogo>
                    <MobileIcon onClick={toggle}>
                        <FaBars />
                    </MobileIcon>
                    <NavMenu>
                        <NavItem>
                            <NavLinks to='about'>About</NavLinks>
                        </NavItem>
                        <NavItem>
                            <NavLinks to='team'>Team</NavLinks>
                        </NavItem>
                        <NavItem>
                            <NavLinks to='faq'>FAQ</NavLinks>
                        </NavItem>
                    </NavMenu>
                    <NavBtnList>
                        {/* change a href to NavBtnLink once signin/signup.js is created */}
                        <NavBtn>
                            <a href='/managers/sign_in' style={{color: "black"}}>Sign In</a>
                        </NavBtn>
                        <NavBtn>
                            <a href='/managers/sign_up' style={{color: "black"}}>Sign Up</a>
                        </NavBtn>
                    </NavBtnList>
                </NavbarContainer>
            </Nav>
        </>
    )
}

export default Header