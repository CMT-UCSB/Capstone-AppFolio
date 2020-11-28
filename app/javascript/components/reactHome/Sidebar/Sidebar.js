import React from 'react'
import { SidebarContainer, Icon, CloseIcon, SidebarWrapper, SidebarMenu, SidebarLink, SideBtnList, SideBtnWrap } from './SidebarElements'

const Sidebar = () => {
  return (
    <SidebarContainer>
      <Icon>
        <CloseIcon />
      </Icon>
      <SidebarWrapper>
        <SidebarMenu>
          <SidebarLink to='about'>About</SidebarLink>
          <SidebarLink to='team'>Team</SidebarLink>
          <SidebarLink to='faq'>FAQ</SidebarLink>
        </SidebarMenu>
        <SideBtnList>
          {/* change a href to SideBtnLink once signin/signup.js is created */}
          <SideBtnWrap>
            <a href='/managers/sign_in'>Sign In</a>
          </SideBtnWrap>
          <SideBtnWrap>
            <a href='/managers/sign_up'>Sign Up</a>
          </SideBtnWrap>
        </SideBtnList>
      </SidebarWrapper>
    </SidebarContainer>
  )
}

export default Sidebar