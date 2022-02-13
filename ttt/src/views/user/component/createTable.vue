<template>
    <div>
        <el-dialog
            title="提示"
            :visible.sync="setvis"
            width="30%"
            :before-close="Close">

            <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
                <el-form-item label="账户" prop="account">
                    <el-input v-model="ruleForm.account"></el-input>
                </el-form-item>
                <el-form-item label="密码" prop="password">
                <el-input  v-model="ruleForm.password"></el-input>
                </el-form-item>
                <el-form-item label="电子邮件" prop="email">
                <el-input  v-model="ruleForm.email"></el-input>
                </el-form-item>
                <el-form-item label="手机号码" prop="phone">
                <el-input  v-model="ruleForm.phone"></el-input>
                </el-form-item>

                <el-form-item>
                <el-button type="primary" @click="submitForm('ruleForm')">立即创建</el-button>
                <el-button @click="resetForm('ruleForm')">重置</el-button>
                </el-form-item>
            </el-form>
        </el-dialog>
    </div>
</template>

<script>

export default {
    name:'createTable',

    props:{
        visible : Boolean,
    },

    data() {
      return {
        vis:false,
        ruleForm: {
          account: '',
          password: '',
          email: '',
          phone: '',
        },
        rules: {
            account: [
            { required: true, message: '请输入用户名', trigger: 'blur' },
            { min: 3, max: 5, message: '长度在 3 到 5 个字符', trigger: 'blur' }
            ],
            password:[
            { required: true, message: '请输入密码', trigger: 'blur' },
            { min: 6, message: '长度大于 6 个字符', trigger: 'blur'}
            ],
            email:[
            { required: true, trigger: 'blur' },
            ],
            phone:[
            { required: true,  trigger: 'blur' },
            ],
        },
      }
    },
    methods: {
      Close() {
        this.vis = false;
        this.$emit("close",this.vis);
      },
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            alert('submit!');
            this.save();
          } else {
            console.log('error submit!!');
            return false;
          }
        });
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
      },

    },
    computed: {
      // 计算属性的 getter
      setvis: function () {
        // `this` 指向 creatTable 实例
        return this.vis = this. visible;
      }
    }
}
</script>