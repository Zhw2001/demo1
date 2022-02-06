export default[
  {
    path: '/',
    name:'main',
    component: () => import('@/views/Main'), // main
    children: [    
      {
      path:'userList',
      name:'userList',
      component: () => import('@/views/userList')
      },
      {
        path:'input',
        name:'input',
        component: () => import('@/views/input')
      },
      {
        path:'userRoleMenu',
        name:'userRoleMenu',
        component: () => import('@/views/userRoleMenu')
      },
      {
        path:'course',
        name:'course',
        component: () => import('@/views/course')
      },
    ]
  },
  {
    path:'/login',
    name:'login',
    component: () => import('@/views/login')
  },
  {
    path:'/regist',
    name:'regist',
    component: () => import('@/views/regist')
  },
]