import styled from 'styled-components'
import { Link as LinkR } from 'react-router-dom'
import { Link as LinkS } from 'react-scroll'

export const Nav = styled.nav `
    background: var(--gray);
    height: 80px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 1rem;
    position: sticky;
    top: 0;
    z-index: 10;

    @media screen and (max-width: 960px) {
        transition: 0.8s all ease;
    }
`;

export const NavbarContainer = styled.div `
    display: flex;
    justify-content: space-between;
    height: 80px;
    z-index: 1;
    width: 100%;
    padding: 0 24px;
    max-wdith: 1100px;
`;

export const NavLogo = styled(LinkS) `
    color: white;
    justify-self: flex-start;
    cursor: pointer;
    font-size: 1.5rem;
    display: flex;
    align-items: center;
    margin-left: 24px;
    font-weight: bold;
    text-decoration: none;

    &:hover{
        color: var(--light);
    }
`;

export const MobileIcon = styled.div `
    display: none;

    @media screen and (max-width:768px) {
        display: block;
        position: absolute;
        top: 0;
        right: 0;
        margin-top: 15px;
        margin-right: 10px;
        transform: tanslate(-100%, 60%);
        font-size: 1.8rem;
        cursor: pointer;
        color: white;
    }
`;

export const NavMenu = styled.ul `
    display: flex;
    align-items: center;
    list-style: none;
    text-align: center;
    margin-right: -22px;
    margin-top: 20px;

    @media screen and (max-width: 768px) {
        display: none;
    }
`;

export const NavItem = styled.li `
    height: 100px;
`;

export const NavLinks = styled(LinkS) `
    color: white;
    display: flex;
    align-items: center;
    text-decoration: none;
    padding: 0 1rem;
    height: 100%;
    cursor: pointer;

    &:hover{
        color: var(--light);
    }

    &.active {
        boarder-bottom: 3px solid white;
    }
`;

export const NavBtnList = styled.li `
    display: flex;
    align-items: center;
    list-style: none;
    margin-top: 18px;

    @media screen and (max-width: 768px) {
        display: none;
    }
`

export const NavBtn = styled.ul `
    display: flex;
    {/* codes from here is for NavBtnLink 
      * remove signin/signup.js is created 
      */}
    border-radius: 50px;
    background: white;
    white-space: nowrap;
    color: black;
    padding: 10px 22px;
    font-size: 16px;
    outline: none;
    border: none;
    cursor: pointer;
    transition: all 0.2s ease-in-out;
    text-decoration: none;

    &:hover {
        transition: all 0.2s ease-in-out;
        background: var(--light);
    }
`

export const NavBtnLink = styled(LinkR) `
    border-radius: 50px;
    background: white;
    white-space: nowrap;
    color: black;
    padding: 10px 22px;
    font-size: 16px;
    outline: none;
    border: none;
    cursor: pointer;
    transition: all 0.2s ease-in-out;
    text-decoration: none;

    &:hover {
        transition: all 0.2s ease-in-out;
        background: var(--light);
    }
`;