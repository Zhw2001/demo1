<template>
<div>
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
        label="学生编号">
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
        label="1-1">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.a_1" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.a_1}}</span>
            </template>
        </el-table-column>

         <el-table-column
        label="1-2">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.a_2" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.a_2}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="1-3">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.a_3" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.a_3}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="1-4">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.a_4" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.a_4}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="1-5">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.a_5" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.a_5}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="1-6">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.a_6" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.a_6}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="2-1">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.b_1" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.b_1}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="2-2">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.b_2" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.b_2}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="2-3">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.b_3" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.b_3}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="2-4">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.b_4" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.b_4}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="3-1">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.c_1" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.c_1}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="3-2">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.c_2" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.c_2}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="3-3">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.c_3" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.c_3}}</span>
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
            <span class="my_button" v-if="!scope.row.selected" @click="RowDel(scope.$index,scope.row)">
                删除
            </span>
            <span class="my_button" v-else  @click="cancel(scope.row)">
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
        :total="this.gdesignData.length">
        </el-pagination>
    </div>
</div>
</template>

<script>
import request from "@/request";
export default{
    name:"course",

    props:{
        gdesignData : Array,
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

        Select(value) {
            console.log(value);
        },
        SelectAll(value){
            console.log(value);
        },

        SetRow(row){
            row.a_1 = this.rowCache.a_1;
            row.a_2 = this.rowCache.a_2;
            row.a_3 = this.rowCache.a_3;
            row.a_4 = this.rowCache.a_4;
            row.a_5 = this.rowCache.a_5;
            row.a_6 = this.rowCache.a_6;
            row.b_1 = this.rowCache.b_1;
            row.b_2 = this.rowCache.b_2;
            row.b_3 = this.rowCache.b_3;
            row.b_4 = this.rowCache.b_4;
            row.c_1 = this.rowCache.c_1;
            row.c_2 = this.rowCache.c_2;
            row.c_3 = this.rowCache.c_3;
            row.cid = this.rowCache.cid;
            row.cnum = this.rowCache.cnum;
            row.id = this.rowCache.id;
            row.overall = this.rowCache.overall;
            row.selected = this.rowCache.selected;
            row.sid = this.rowCache.sid;
            row.sname = this.rowCache.sname;
            row.stime = this.rowCache.stime;
        },

        RowSave(row){
            this.wlock = true;
            request.post("/api_S/gdesign/update",row).then(res =>{
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
            var type = 3;
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
            request.post("/api_S/gdesign/delete",row).then(res =>{
                if(res.code != '111'){
                    this.$message("删除成功");
                    this.gdesignData.splice(index,1);
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
            this.currentPageData = this.gdesignData.slice(begin,end);
        },
        SizeChange(v){
            this.pageSize = v;
            this.setCurrentPageData();
        },
        CurrentPageChange(v){
            this.currentPage = v;
            this.setCurrentPageData();
        },
        load(){
            // 计算一共有几页
            this.totalPage = Math.ceil(this.gdesignData.length / this.pageSize);
            this.totalPage = this.totalPage == 0 ? 1 : this.totalPage;
            this.setCurrentPageData();
        }

    },

    created(){
        this.load();
    },

    watch:{
        visible : function(newV,oldV){
            this.load();
        },
        gdesignData :function(){
            this.load();
        },
        w_lock : function(){
            this.wlock = this.w_lock;
            this.CurrentPageChange(this.totalPage);
            this.rowCache = null;
        }
    },
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