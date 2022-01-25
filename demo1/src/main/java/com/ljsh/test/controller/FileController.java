package com.ljsh.test.controller;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.StrUtil;
import com.ljsh.test.utils.MyResponse;
import com.ljsh.test.dto.Result;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;


@RestController
@RequestMapping("/files")
public class FileController {

    @Value("${my.filepath}") //获取字符串常量
    private String mypath;//指定路径

    @Value("${server.port}") //获取字符串常量
    private String port;//指定路径


    @PostMapping("/upload")
    public Result<?> upload(MultipartFile file) throws IOException{
        //前缀：时间戳精确到毫秒
        String originalFilename = file.getOriginalFilename();
        Long time = System.currentTimeMillis();
        String flag = time.toString();
        String rootFilePath = mypath + flag + "_" + originalFilename;
        FileUtil.writeBytes(file.getBytes(),rootFilePath);
        return Result.success(flag + "_" + originalFilename);
    }

    @GetMapping("/get_port")
    public Result<?> getPort(){
        return Result.success(port);
    }

    @GetMapping("/{filename}")
    public void getFiles(@PathVariable String filename, HttpServletResponse response){
        OutputStream os;
        try{
            if(StrUtil.isNotEmpty(filename)){
                response.addHeader("Content-Disposition","attachment;filename=" + URLEncoder.encode(filename,"UTF-8"));//设置文件名
                String rootFilePath =mypath+filename;
                response.setContentType("application/octet-stream");
                byte[] bytes = FileUtil.readBytes(rootFilePath);
                os = response.getOutputStream();
                os.write(bytes);
                os.flush();
                os.close();
            }
        }catch(Exception e){
            System.out.println("下载失败");
            MyResponse.writeResult(response, Result.error("404","下载失败"));
        }

    }

}
