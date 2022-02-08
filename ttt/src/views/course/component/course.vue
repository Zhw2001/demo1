<template>
<div v-if = "setvis" >
    <el-table       
        :fit = "true"
        size='mini'
        :header-cell-style = "mytable"
        :cell-style = "mytableCell"
        :data="currentPageData"
        @select="Select"
        @select-all = "SelectAll">
        <el-table-column
        type="selection">
        </el-table-column>

        <el-table-column v-if='false'>
            <template slot-scope="scope">
                <span>{{scope.row.id}}</span>
            </template>
        </el-table-column>

        <el-table-column
          label="学年">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.stime" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.stime}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="课程编号">
        <template slot-scope="scope">
            <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.cid" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.cid}}</span>
        </template>
        </el-table-column>

        <el-table-column
        label="课程序号">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.cnum" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.cnum}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="学号">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.sid" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.sid}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="学生姓名">  
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.sname" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.sname}}</span>
            </template>
        </el-table-column>    

        <el-table-column
        label="学生专业">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.sclass" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.sclass}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="学生状态">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.sstate" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.sstate}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="平时成绩">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.regular" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.regular}}</span>
            </template>
        </el-table-column>
            
        <el-table-column
        label="卷面成绩">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.written" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.written}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="总成绩">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.overall" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.overall}}</span>
            </template>
        </el-table-column>

        <el-table-column label="操作">
        <template slot-scope="scope">
            <span class="my_button" v-if="!scope.row.selected" @click="edit(scope.row)">
                修改
            </span>
            <span class="my_button" v-else  @click="RowSave(scope.row)">
                保存
            </span>
            <span class="my_button" v-if="!scope.row.selected" @click="RowDel(scope.row)">
                删除
            </span>
            <span class="my_button" v-else  @click="cancel(scope.$index,scope.row)">
                取消
            </span>
        </template>
        </el-table-column>
    </el-table>
    <div style="margin: 10px 0">
        <el-pagination
        class="pagination"
        @size-change="SizeChange"
        @current-change="CurrentPageChange"
        :current-page="currentPage"
        :page-sizes="[5, 10, 15, 20]"
        :page-size="10"
        layout="total, sizes, prev, pager, next, jumper"
        :total="this.courseData.length">
        </el-pagination>
    </div>
</div>
</template>

<script>
import request from "@/request";
export default{
    name:"course",

    props:{
        visible : Boolean,
        courseData : Array,
        w_lock : Boolean,
    },

    data(){
        return{
            wlock:true,
            rowCache:{},
            totalPage: 1, // 统共页数，默认为1
            currentPage: 1, //当前页数 ，默认为1
            pageSize: 10, // 每页显示数量
            currentPageData:[], //当前页显示内容
        }
    },
    methods:{

        mytable(){
            return 'background-color:#f1f3fa; color:rgba(0, 0, 0, 0.85);font-weight: 500;text-align:center;'
        },
        mytableCell(){
            return 'text-align:center;font-size: 5px;'
        },

        SetRow(row){
            row.id = this.rowCache.id;
            row.regular = this.rowCache.regular;
            row.written = this.rowCache.written;
            row.overall = this.rowCache.overall;
            row.stime = this.rowCache.stime;
            row.sid = this.rowCache.sid;
            row.cid = this.rowCache.cid;
            row.sclass = this.rowCache.sclass;
            row.sstate = this.rowCache.sstate;
            row.sname = this.rowCache.sname;
            row.cnum = this.rowCache.cnum;
            row.selected= this.rowCache.selected;
        },


        //批量处理
        Select(value) {
            console.log(value);
        },
        SelectAll(value){
            console.log(value);
        },

        //增删改
        RowSave(row){
            this.wlock = true;
            request.post("/api_S/course/update",row).then(res =>{
                if(res.code != '111'){
                    this.$message("保存成功");
                }
                else{
                    this.$message("Failed")
                }
            });
            row.selected = false;
        },
        edit(row){
            this.rowCache = JSON.parse(JSON.stringify(row));
            if(!this.wlock){
                this.$message.warning("请先保存当前编辑项");
                return;
            }
            row.selected = true;
            this.wlock = false;
        },
        cancel(row){
            var type = 0;
            console.log(type);
            this.wlock = true;
            if(this.rowCache != null){this.SetRow(row);}
            this.$emit("delEmptyRow",type);
        },
        RowDel(index,row){
            if(!this.wlock){
                this.$message.warning("请先保存当前编辑项");
                return;
            }
            request.post("/api_S/course/delete",row).then(res =>{
                if(res.code != '111'){
                    this.$message("删除成功");
                    this.courseData.splice(index,1);
                    this.load();
                }
                else{
                    this.$message("Failed")
                }
            });
        },

        //前端分页
        setCurrentPageData() {
            let begin = (this.currentPage - 1) * this.pageSize;
            let end = this.currentPage * this.pageSize;
            this.currentPageData = this.courseData.slice(begin,end);
        },
        SizeChange(v){
            this.pageSize = v;
            this.setCurrentPageData();
        },
        CurrentPageChange(v){
            this.currentPage = v;
            this.setCurrentPageData();
        },


        //初始化表格数据
        load(){
            // 计算一共有几页
            this.totalPage = Math.ceil(this.courseData.length / this.pageSize);
            this.totalPage = this.totalPage == 0 ? 1 : this.totalPage;
            this.setCurrentPageData();//加载数据
        },

    },

    created(){
        this.load();
    },

    computed: {
        setvis: function () {
            return this.visible;
        },
    },

    watch:{
        visible : function(newV,oldV){
            this.load();
        },
        courseData :function(){
            this.load();
        },
        w_lock : function(){
            this.wlock = this.w_lock;
            this.CurrentPageChange(this.totalPage);
            this.rowCache = null;
        }
    }
}
</script>

<style scoped>
.my_button{
    padding:2px;   
}
.my_button:hover{
    color:red;
}

</style>