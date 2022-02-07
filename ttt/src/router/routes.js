export default[
  {
    path: '/',
    name:'main',
    component: () => import('@/views/Main'), // main
    children: [    
      {
      path:'user',
      name:'user',
      component: () => import('@/views/user')
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