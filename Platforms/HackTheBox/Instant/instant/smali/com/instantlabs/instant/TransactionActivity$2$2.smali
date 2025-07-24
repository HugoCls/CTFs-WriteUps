.class Lcom/instantlabs/instant/TransactionActivity$2$2;
.super Ljava/lang/Object;
.source "TransactionActivity.java"

# interfaces
.implements Lokhttp3/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/instantlabs/instant/TransactionActivity$2;->onResponse(Lokhttp3/Call;Lokhttp3/Response;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field final synthetic this$1:Lcom/instantlabs/instant/TransactionActivity$2;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 111
    const-class v0, Lcom/instantlabs/instant/TransactionActivity;

    return-void
.end method

.method constructor <init>(Lcom/instantlabs/instant/TransactionActivity$2;)V
    .locals 0

    iput-object p1, p0, Lcom/instantlabs/instant/TransactionActivity$2$2;->this$1:Lcom/instantlabs/instant/TransactionActivity$2;

    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Lokhttp3/Call;Ljava/io/IOException;)V
    .locals 0

    iget-object p1, p0, Lcom/instantlabs/instant/TransactionActivity$2$2;->this$1:Lcom/instantlabs/instant/TransactionActivity$2;

    .line 114
    iget-object p1, p1, Lcom/instantlabs/instant/TransactionActivity$2;->this$0:Lcom/instantlabs/instant/TransactionActivity;

    new-instance p2, Lcom/instantlabs/instant/TransactionActivity$2$2$1;

    invoke-direct {p2, p0}, Lcom/instantlabs/instant/TransactionActivity$2$2$1;-><init>(Lcom/instantlabs/instant/TransactionActivity$2$2;)V

    invoke-virtual {p1, p2}, Lcom/instantlabs/instant/TransactionActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onResponse(Lokhttp3/Call;Lokhttp3/Response;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 124
    invoke-virtual {p2}, Lokhttp3/Response;->isSuccessful()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 126
    invoke-virtual {p2}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object p1

    invoke-virtual {p1}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    .line 128
    :try_start_0
    invoke-static {p1}, Lcom/google/gson/JsonParser;->parseString(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object p1

    const-string v0, "Description"

    .line 129
    invoke-virtual {p1, v0}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "Transaction Successful"

    .line 130
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/instantlabs/instant/TransactionActivity$2$2;->this$1:Lcom/instantlabs/instant/TransactionActivity$2;

    .line 131
    iget-object p1, p1, Lcom/instantlabs/instant/TransactionActivity$2;->this$0:Lcom/instantlabs/instant/TransactionActivity;

    const-string v0, "Transaction Completed"

    invoke-static {p1, v0, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Lcom/google/gson/JsonSyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    iget-object v0, p0, Lcom/instantlabs/instant/TransactionActivity$2$2;->this$1:Lcom/instantlabs/instant/TransactionActivity$2;

    .line 134
    iget-object v0, v0, Lcom/instantlabs/instant/TransactionActivity$2;->this$0:Lcom/instantlabs/instant/TransactionActivity;

    const-string v1, "Something Went Wrong"

    invoke-static {v0, v1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p2

    invoke-virtual {p2}, Landroid/widget/Toast;->show()V

    .line 135
    sget-object p2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Error Occurred: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/google/gson/JsonSyntaxException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void
.end method
