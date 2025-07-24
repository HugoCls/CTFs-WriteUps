.class Lcom/instantlabs/instant/RegisterActivity$3$3;
.super Ljava/lang/Object;
.source "RegisterActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/instantlabs/instant/RegisterActivity$3;->onResponse(Lokhttp3/Call;Lokhttp3/Response;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/instantlabs/instant/RegisterActivity$3;

.field final synthetic val$response:Lokhttp3/Response;


# direct methods
.method constructor <init>(Lcom/instantlabs/instant/RegisterActivity$3;Lokhttp3/Response;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/instantlabs/instant/RegisterActivity$3$3;->this$1:Lcom/instantlabs/instant/RegisterActivity$3;

    iput-object p2, p0, Lcom/instantlabs/instant/RegisterActivity$3$3;->val$response:Lokhttp3/Response;

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/instantlabs/instant/RegisterActivity$3$3;->this$1:Lcom/instantlabs/instant/RegisterActivity$3;

    .line 117
    iget-object v0, v0, Lcom/instantlabs/instant/RegisterActivity$3;->this$0:Lcom/instantlabs/instant/RegisterActivity;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Registration Failed :"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/instantlabs/instant/RegisterActivity$3$3;->val$response:Lokhttp3/Response;

    invoke-virtual {v2}, Lokhttp3/Response;->message()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 118
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Registration Failed : "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/instantlabs/instant/RegisterActivity$3$3;->val$response:Lokhttp3/Response;

    invoke-virtual {v2}, Lokhttp3/Response;->message()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void
.end method
